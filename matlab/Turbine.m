classdef Turbine < handle

    % Simile a IndustrialObject ma possiede degli attributi in più e non ha
    % il campo type
    properties
        state = "Entered";
        weight;
        prop1;
        prop2;
        shouldDelete = false;
        waitingTime=0;
        graphic;
    end

    methods

        function obj = Turbine(weight, graphic)
            obj.state;
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
    end

end