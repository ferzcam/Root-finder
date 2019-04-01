function [Input,Target]=PrepararDatos(Data)
Input=[Data(:,1:2) -ones(size(Data,1),1)];
Target=Data(:,3);