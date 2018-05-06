local cjson = require("cjson")


local strSrc = "{1118163:{\"admin\":true,\"aliUsername\":\"\",\"joinChannel\":1,\"joinTime\":1524623931939,\"lastOnlineTime\":0,\"memberAlias\":\"\",\"memberName\":\"fanqie\",\"memberSmallAvatarUrl\":\"1118163_1524558923947_f1d2a7b4-8a29-4d77-a2cb-d747b9835182\",\"memberUid\":1118163,\"mobile\":\"\",\"other1\":\"\",\"other2\":\"\",\"ownerId\":1118163,\"referenceNickName\":\"\",\"referenceUid\":1118163,\"wxUsername\":\"\"},1107379:{\"admin\":false,\"aliUsername\":\"\",\"joinChannel\":1,\"joinTime\":1524623931939,\"lastOnlineTime\":1524822045777,\"memberAlias\":\"\",\"memberName\":\"zhangsan\",\"memberSmallAvatarUrl\":\"1107379_1524636255353_7a3042e2-9d41-46c3-8254-dfae0bdf5179\",\"memberUid\":1107379,\"mobile\":\"\",\"other1\":\"\",\"other2\":\"\",\"ownerId\":1118163,\"referenceNickName\":\"fanqie\",\"referenceUid\":1118163,\"wxUsername\":\"\"},1131536:{\"admin\":false,\"aliUsername\":\"\",\"joinChannel\":1,\"joinTime\":1524623931939,\"lastOnlineTime\":1524818878154,\"memberAlias\":\"\",\"memberName\":\"tttt0988\",\"memberSmallAvatarUrl\":\"1131536_1524627081807_ac561f50-1b6e-4fa7-b364-1d8d3b310fdf\",\"memberUid\":1131536,\"mobile\":\"\",\"other1\":\"\",\"other2\":\"\",\"ownerId\":1118163,\"referenceNickName\":\"fanqie\",\"referenceUid\":1118163,\"wxUsername\":\"\"}}"


print("=====================================================")

-- 返回一个标准格式的json串,key值加上引号
local function formatMembersJson(strMembersInfo)
    local strJson = string.gsub( strMembersInfo, "%d+:{" , function(s)
        local flagPos = string.find(s, ":")
        if flagPos ~= nil then
            return "\"" .. string.sub( s, 1, flagPos - 1 ) .. "\"".. string.sub(s, flagPos, #s)
        else
            -- 错误日志
            print("error")
        end
    end)
    return strJson
end

local function getMembersInfo()
    local strJson = formatMembersJson(strSrc)
    local unJson = cjson.decode(strJson)
    for _, v in pairs(unJson) do
        print(v['admin'])
        print(v['joinTime'])
        print(v['memberName']) 
    end
end

getMembersInfo()
