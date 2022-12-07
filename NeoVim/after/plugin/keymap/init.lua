local Remap = require("ckoch786.keymap")

local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

print("Creating Rosterapps bindings")
nnoremap("<leader>gra", ":Explore C:\\Users\\CKoch\\Documents\\Source\\arcos_rosterapps_new")
nnoremap("<leader>grad", ":Explore C:\\Users\\CKoch\\Documents\\Source\\arcos_rosterapps_database")
nnoremap("<leader>grauth", ":Explore C:\\Users\\CKoch\\Documents\\Source\\authenticationapi")
--nnoremap("<leader>ss", ":Explore C:/Users/CKoch/OneDrive\ -\ ARCOS LLC/Documents/scratch")


