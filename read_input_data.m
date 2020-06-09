% reads cluster count and points from input files 
function [NC points] = read_input_data(file_params, file_points)
NC = 0;
NC = load('-ascii',file_params);
points = [];
points = dlmread(file_points,' ',5,1);
  
endfunction

