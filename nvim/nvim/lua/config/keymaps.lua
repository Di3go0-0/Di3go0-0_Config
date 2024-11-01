-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = false }
local Util = require("lazyvim.util")

local function safe_del(mode, lhs)
  local status, _ = pcall(function()
    keymap.del(mode, lhs)
  end)
  if not status then
    print("No se pudo eliminar el mapeo: " .. lhs)
  end
end

local function set_keymaps()
  -- Eliminar keymaps existentes de forma segura
  safe_del("n", "<C-W>h")
  safe_del("n", "<C-W>l")
  safe_del("n", "<C-W>k")
  safe_del("n", "<C-W>j")
  safe_del("n", "<C-h>")
  safe_del("n", "<C-l>")

  -- Añadir nuevas keymaps
  keymap.set("n", "<C-k>", "<C-w>j", opts) --Down
  keymap.set("n", "<C-i>", "<C-w>k", opts) --Up
  keymap.set("n", "<C-j>", "<C-w>h", opts) --Left
  keymap.set("n", "<C-l>", "<C-w>l", opts) --Right
  -- keymap.set("n", "<C-s>", "", opts)
end

-- Llamar a la función para establecer las keymaps
set_keymaps()
