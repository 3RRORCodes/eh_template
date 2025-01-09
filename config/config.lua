ehConfig = {}

ehConfig.debug = true -- Should debug mode be enabled? (true/false)
ehConfig.interaction = "target" -- Which interaction system is being used ("target", "interact", or "3dtext")?

----------------
--- WARNING: DO NOT MODIFY ANYTHING BELOW THIS LINE
----------------
lib.locale()

eh = exports["eh_codekit"]:load()

_debug = function(...)
    if ehConfig.debug then
        eh.debug(...)
    end
end
