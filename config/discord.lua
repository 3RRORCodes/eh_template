--------------------
--- Need help getting your bot token, server ID, or webhook URL? Check our guide:
--- https://docs.errorhub.co/error-hub/discord-guide
--------------------
discordCfg = {}

discordCfg.guildId = "YOUR_SERVER_GUILD_ID_HERE"  -- What is the ID of your Discord server?
discordCfg.botToken = "YOUR_BOT_TOKEN_HERE"  -- What is the token for your Discord bot?
discordCfg.log = {
    enable = false,   -- Do you want to log moderation actions to your Discord channel?
    error = true,    -- Do you want to log errors aswell to your Discord channel?
    webhook = "YOUR_LOGS_WEBHOOK_HERE"  -- Where should moderation actions be logged? (Provide your webhook URL)
}

----------------
--- WARNING: DO NOT MODIFY ANYTHING BELOW THIS LINE
----------------

require "@eh_codekit.modules.discord.main"