classdef IndustrialObject < handle
    
    properties
        Type
        Weight
        Graphic 
        State
    end
    
    methods
        
        function obj = IndustrialObject(type, weight, graphic)           
            obj.Type = type;
            obj.Weight = weight;
            obj.Graphic = graphic; 
            obj.State = "Entered";
        end
        
        %% Movement functions
        function Move(obj, dx, dy)            
            p = obj.Graphic.Position;           
            p(1) = p(1) + dx;
            p(2) = p(2) + dy;            
            obj.Graphic.Position = p;            
        end
        
        %% Getters and setters
        
        function x = GetX(obj)           
            x = obj.Graphic.Position(1);           
        end

        function w = GetWeight(obj)
            w = obj.Weight;
        end
        
        function SetState(obj, state)
            obj.State = state;
        end
    end
    
end