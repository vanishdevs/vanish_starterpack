-- ESX
ALTER TABLE `users` ADD `getStarter` INT NOT NULL DEFAULT '0'

-- OX Core
ALTER TABLE `characters` ADD `getStarter` INT NOT NULL DEFAULT '0'

-- -- QBCore & QBX
ALTER TABLE `players` ADD `getStarter` INT NOT NULL DEFAULT '0'
