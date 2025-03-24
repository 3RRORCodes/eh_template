CreateThread(function()
    local version = {}

    function version.parse(versionString)
        local versionNumbers = {}
        for number in versionString:gmatch("%d+") do
            table.insert(versionNumbers, tonumber(number))
        end
        return versionNumbers
    end

    function version.compare(installed, available)
        for i = 1, math.max(#installed, #available) do
            local installedPart = installed[i] or 0
            local availablePart = available[i] or 0
            if installedPart ~= availablePart then
                return installedPart < availablePart and -1 or 1
            end
        end
        return 0
    end

    function version.check()
        local resourceName = GetResourceMetadata(GetCurrentResourceName(), 'name', 0)
        local currResource = GetCurrentResourceName()
        local installedVersion = GetResourceMetadata(currResource, 'version', 0)
        local versionCheckUrl = 'https://raw.githubusercontent.com/3RRORCodes/versionCheck/master/resources.json?v=' .. os.time()

        PerformHttpRequest(versionCheckUrl, function(err, result)
            if err ~= 200 or not result or not json.decode(result)[resourceName]?.version then
                print("^5=== === === === === === === === === === === ===^7")
                print("^1[ERROR] ^7Failed to check for updates.")
                print("^5=== === === === === === === === === === === ===^7")
                return
            end

            local response = json.decode(result)[resourceName]
            local availableVersion = response.version
            local comparison = version.compare(version.parse(installedVersion), version.parse(availableVersion))
            local messages = {
                [-1] = '^7Update available for ^5%s^7! \nDownload it from ^3<https://portal.cfx.re/assets/granted-assets>^7.',
                [0] = '^7You are using the latest version of ^5%s^7. \nVisit ^3<https://errorhub.tebex.io>^7 for more.',
                [1] = '^3[WARNING] ^7You are on a newer version of ^5%s^7 than the current release.'
            }

            print("^5=== === === === === === === === === === === ===^7")
            print(string.format('^5[%s] ^2Installed^7: ^1%s ^7| ^2Latest^7: ^1%s', resourceName, installedVersion, availableVersion))
          if response.notes then
                print(string.format('^5[NOTES] ^3%s', response.notes))
            end
            print(string.format(messages[comparison], resourceName))
            print("^5=== === === === === === === === === === === ===^7")
        end, 'GET')
    end

    version.check()
end)
