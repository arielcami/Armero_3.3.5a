--[[
    Ariel Camilo // ariel.cami@gmail.com // 3 de Marzo 2022
    Si ya entrenaste tus armas, puedes volver otra vez con más nivel para subir al máximo tus skills de armas.
]]

local NPCID = 00000  --> Reemplaza 00000 con el ID del NPC al que asignarás el script.
local L15 = 'Debes haber alcanzado el nivel 15, '

local SKILLS_ = {
--[[Guerrero]]  [   1] = {264, 2567, 200, 266, 5011, 1180, 201, 202, 196, 197, 198, 199, 227, 15590},
--[[Paladín]]   [   2] = {200, 201, 202, 196, 197, 198, 199},
--[[Cazador]]   [   4] = {264, 2567, 200, 266, 5011, 227, 1180, 201, 202, 196, 197, 15590},
--[[Pícaro]]    [   8] = {264, 2567, 266, 5011, 1180, 201, 196, 198, 15590},
--[[Sacerdote]] [  16] = {227, 1180, 198, 5009},
--[[DK]]        [  32] = {200, 201, 202, 196, 197, 198, 199},
--[[Chamán]]    [  64] = {227, 1180, 196, 197, 198, 199, 15590},
--[[Mago]]      [ 128] = {227, 1180, 201, 5009},
--[[Brujo]]     [ 256] = {227, 1180, 201, 5009},
--[[Druida]]    [1024] = {200, 227, 1180, 198, 199, 15590}}

local function ClickNPC(E, P, U)  local L, C, name = P:GetLevel(), P:GetClassMask(), P:GetName()

    if L<=14 then U:SendUnitSay(L15..name..'.', 0) return end

    if L>=15 then 
        for i=1, #SKILLS_[C] do 
            if P:HasSpell(SKILLS_[C][i]) then 
                --No hacer absolutamente nada
            else 
                P:LearnSpell(SKILLS_[C][i])
            end 
        end           
    end    
    P:AdvanceSkillsToMax() 
end
RegisterCreatureGossipEvent(NPCID, 1, ClickNPC) 
