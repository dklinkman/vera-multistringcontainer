--
-- this goes into the lua tab of a scene that is watching the Options variable in the device
-- format of the mqtt payload value in Options is: "Variable1:Text to write to variable"
-- the text will be copied to the given variable 1 - 5
-- use "Variable1:" with no text to clear the variable
--
local device_id = 343 -- impt device_id must match the desired vcontainer device
local opt_string = luup.variable_get("urn:upnp-org:serviceId:VContainer1", "Options", device_id) or ""
if opt_string and opt_string ~= "" then
    local variable, value = string.match(opt_string, "(.*):(.*)")
    luup.variable_set("urn:upnp-org:serviceId:VContainer1", variable, value, device_id)
end
return true