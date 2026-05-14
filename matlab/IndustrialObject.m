classdef IndustrialObject < handle
    
    properties
        type
        weight
        graphic 
        state
        shouldDelete = false;
        waitingTime=0;
    end
    
    methods
        
        function obj = IndustrialObject(weight, graphic)           
            obj.type = "NotClassified";
            obj.state
            obj.weight = weight;
            obj.graphic = graphic; 
        end
        
        %% Movement functions
        function move(obj, dx, dy)            
            p = obj.graphic.Position;           
            p(1) = p(1) + dx;
            p(2) = p(2) + dy;            
            obj.graphic.Position = p;            
        end
        
        %% Getters and setters
        
        function x = getX(obj)           
            x = obj.graphic.Position(1);           
        end

        function y = getY(obj)           
            y = obj.graphic.Position(2);           
        end

        function w = getWeight(obj)
            w = obj.weight;
        end
        
        function setState(obj, newState)
            obj.state = newState;
        end

        function setType(obj, newType)
            obj.type = newType;
        end
    end
    
end