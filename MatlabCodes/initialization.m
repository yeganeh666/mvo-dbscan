function inits  = initialization(reposityName,data,AlgName)

if strcmp(reposityName,'artificial')
 inits  = initialization_artificial_rep(data,AlgName);
end

if strcmp(reposityName,'UCI')
 inits  = initialization_UCI_rep(data,AlgName);
end

end