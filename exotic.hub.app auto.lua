local plr = game:GetService("Players").LocalPlayer

-- Anti-Kick Protection
getgenv().Anti = true
local Anti
Anti = hookmetamethod(game, "__namecall", function(self, ...)
	if self == plr and getnamecallmethod():lower() == "kick" and getgenv().Anti then
		return warn("[ANTI-KICK] Client Tried To Call Kick Function On LocalPlayer")
	end
	return Anti(self, ...)
end)

-- Exotic Hub Request Bypass
local old; old = hookfunction(request, function(data)
	if data.Url ~= "https://exotichub.app/vpro" then
		return old(data)
	end

	return {
		Success = true,
		StatusCode = 200,
		Body = game:GetService("HttpService"):JSONEncode({
			success = true
		})
	}
end)

print("[LOADED] Anti-Kick and Exotic Hub Bypass Active")

-- Load Exotic Hub
loadstring(game:HttpGet("https://exotichub.app/auto.lua"))()
