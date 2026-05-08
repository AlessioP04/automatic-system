classdef IndustrialObject < handle
    
    properties
        Type
        Weight
        Graphic 
    end
    
    methods
        
        function obj = IndustrialObject(type, weight, graphic)
            
            obj.Type = type;
            obj.Weight = weight;
            obj.Graphic = graphic; 
            
        end
        
        
        function Move(obj, dx, dy)
            
            p = obj.Graphic.Position;
            
            p(1) = p(1) + dx;
            p(2) = p(2) + dy;
            
            obj.Graphic.Position = p;
            
        end
        
        
        function x = GetX(obj)
            
            x = obj.Graphic.Position(1);
            
        end

        function valid = CheckObject(obj)
            valid = false;        
            if obj.Weight >= 1 && obj.Weight <= 2      
                valid = (obj.Weight >= 1.4 && obj.Weight <= 1.6);      
            elseif obj.Weight >= 4 && obj.Weight <= 5      
                valid = (obj.Weight >= 4.4 && obj.Weight <= 4.6);      
            elseif obj.Weight >= 7 && obj.Weight <= 8      
                valid = (obj.Weight >= 7.4 && obj.Weight <= 7.6);
            end
        end
        
    end
    
end