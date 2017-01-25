require 'json'
require 'rest-client'
require 'rcon/rcon'
require 'minecraft-query'
module Redlist
    def self.add(whitelistPath, _username, rconPassword, rconIP = '127.0.0.1', rconPort = '25575')
        whitelist = JSON.parse(File.read(whitelistPath))
        shouldUpdateList = true
        whitelist.each do |line|
            shouldUpdateList = false if line['name'] == _username
        end

        if shouldUpdateList == true

            res = RestClient.post 'https://api.mojang.com/profiles/minecraft',
                                  _username.to_json,
                                  content_type: :json,
                                  accept: :json

            result = JSON.parse res
            if res.code == 200 && !result[0].nil? && !result.nil?
                whitelist << { 'uuid' => result[0]['id'], 'name' => result[0]['name'] }
                File.open(whitelistPath, 'w') do |f|
                    f.write(whitelist.to_json)
                end
                updateList(rconPassword, rconIP, rconPort)
                return 'Username added to list.'
            else
                return 'Unable to add user to list. Check username, or internet connection. '
            end

        else
            updateList(rconPassword, rconIP, rconPort)
            return 'Username already on list'
       end
    end

    def self.updateList(_rconPassword, _rconIP, _rconPort)
        rcon = RCON::Minecraft.new(_rconIP, _rconPort)
        rcon.auth(_rconPassword)
        output = rcon.command('whitelist reload')
        output
end
end
