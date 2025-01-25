ehConfig = {}

ehConfig.debug = {
    code = true, -- Do you want to enable debugs for code? (true/false)
    zone = true -- Do you want to enable debugs for zones i.e. zones & target? (true/false)
}
ehConfig.interaction = "target" -- Which interaction system should be used ("target", "interact", or "3dtext")?

----------------
--- WARNING: DO NOT MODIFY ANYTHING BELOW THIS LINE
----------------
lib.locale()

eh = exports.eh_codekit:load()
if not eh then print("^1[ERROR]^7 eh_codekit is not loaded, please load it first!") return end

_debug = function(...)
    if ehConfig.debug.code then
        eh.debug(...)
    end
end
