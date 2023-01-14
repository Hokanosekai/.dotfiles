local status, zn = pcall(require, 'zen-mode')
if (not status) then return end

zn.setup {}
