---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2018/9/14 0014 11:32
---

local aes = require "bgcrypto"
local crypt = require "skynet.crypt"
local json = require("json")
local utils = require("utils")

local cbc_encrypt = aes.cbc_encrypter()
local cbc_decrypt = aes.cbc_decrypter()

local this = {}

function this.decrypt(source,key,iv)
    local decryptData = string.gsub(source," ","+")
    decryptData = crypt.base64decode(decryptData)
    local decryptKey = crypt.base64decode(key)
    local decrypt_iv = crypt.base64decode(string.gsub(iv," ","+"))
    cbc_decrypt:open(decryptKey, decrypt_iv)
    local decrypt = cbc_decrypt:write(decryptData)
    cbc_decrypt:close()
    --decrypt = string.gsub(decrypt, "^%s*(.-)%s*$", "%1")
    --print(string.format("%s",decrypt))
    --print(string.find(decrypt,"%\2"))
    --decrypt = string.gsub(decrypt,"\2","")
    --print(string.format("%q",string.gsub(source," ","+")))
    --print(string.format("%q",key))
    --print(string.format("%q",string.gsub(iv," ","+")))
    return decrypt --json.decode(decrypt)
end

return this