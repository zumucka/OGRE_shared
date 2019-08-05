function [s] = process_file(filename)

fid = fopen(filename,'r');
s = struct;
while 1
   str = fgetl(fid);
   if str==-1
       break;
   elseif isempty(str)
       continue;
   else
       idx = regexp(str,' = ');
       if idx
           name = regexprep(str(1:idx-1),' ','');
           val = str2num(str(idx+3:end-1)); %#ok<ST2NM>
           s.(name) = val;
       end
   end   
end
fclose(fid);

end
