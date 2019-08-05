function [] = generate_file(type_name, varargin)

if strcmp(type_name,'OGRE_header')
    generate_OGRE_header(varargin{:});
elseif strcmp(type_name,'OGRE_simulate')
    generate_OGRE_simulate(varargin{:});
elseif strcmp(type_name,'OGRE_terminal_state')
    generate_OGRE_terminal(varargin{:});
elseif strcmp(type_name,'OGRE_shocks')
    generate_OGRE_shocks(varargin{:});
elseif strcmp(type_name,'OGRE_setup_sim')
    generate_OGRE_setup_sim(varargin{:});
end

end

function [] = generate_OGRE_setup_sim(varargin)
p = inputParser;
addOptional(p, 'use_ref', 0, @isnumeric);
p.KeepUnmatched = true;
parse(p,varargin{:});

use_ref = p.Results.use_ref;

filename = 'solve/OGRE_setup_sim.mod';
fid = fopen(filename, 'w');
fprintf(fid,'@#include "solve/OGRE_solve_term.mod"\n');
if use_ref
    fprintf(fid,'@#include "solve/OGRE_shocks.mod"\n');
end
    
fclose(fid);

end

function [] = generate_OGRE_header(varargin)

p = inputParser;
addOptional(p, 'scenario', 0, @isnumeric);
addOptional(p, 'pension', 1, @isnumeric);
addOptional(p, 'use_ref', 0, @isnumeric);
addOptional(p, 'sim_per', 200, @isnumeric);
addOptional(p, 'ref_per', 30, @isnumeric);
addOptional(p, 'filename', 'solve/OGRE_header.mod', @ischar);
p.KeepUnmatched = true;
parse(p,varargin{:});

filename = p.Results.filename;
scenario = p.Results.scenario;
pension = p.Results.pension;
fid = fopen(filename, 'w');

fprintf(fid,'@#define SCENARIO = %d\n',scenario);
fprintf(fid,'@#define PENSION_SYSTEM = %d\n',pension);
fprintf(fid,'@#define TERM_FILENAME = "%s"\n',strcat('setparam/term_state_',num2str(scenario),'.mod'));

fclose(fid);

end

function [] = generate_OGRE_simulate(varargin)

p = inputParser;
addOptional(p, 'sim_per', 200, @isnumeric);
p.KeepUnmatched = true;
parse(p,varargin{:});

filename = 'solve/OGRE_simulate.mod';
sim_per = p.Results.sim_per;
fid = fopen(filename, 'w');

fprintf(fid,'simul(periods=%d);\n',sim_per);

fclose(fid);

end

function [] = generate_OGRE_terminal(varargin)

global pension_system

p = inputParser;
addOptional(p, 'data', [],@isstruct);
addOptional(p, 'filename', 'setparam/term_state_0.mod', @ischar);
p.KeepUnmatched = true;
parse(p,varargin{:});

filename = p.Results.filename;
fid = fopen(filename, 'w');
data = p.Results.data;
fn = fieldnames(data);
for i = 1:numel(fn)
    varname = fn{i};
    if ~strcmp(varname,'nu') || pension_system
        fprintf(fid,'%s = %2.4f;\n',varname,data.(varname)); 
    end
end
fclose(fid);

end

function [] = generate_OGRE_shocks(varargin)

p0 = inputParser;
addOptional(p0, 'per_init', 1, @isnumeric);
addOptional(p0, 'per_term', 30, @isnumeric);
addOptional(p0, 'values', 0, @isnumeric);
addOptional(p0, 'shkname', 'shk_prob_die', @ischar);
addOptional(p0, 'shkfilename','s',@ischar);
p0.KeepUnmatched = true;
parse(p0,varargin{:});

shkname = p0.Results.shkname;
per_init = p0.Results.per_init;
per_term = p0.Results.per_term;
filename = 'solve/OGRE_shocks.mod';
values = p0.Results.values;
shkfilename = p0.Results.shkfilename;

fid = fopen(filename, 'w');

if length(shkfilename)>0 %#ok<*ISMT>
    fprintf(fid,'load(''%s'',''x'');\n',shkfilename);
else
    try
        fprintf(fid,'x = [');
        for i=1:length(values)-1
            fprintf(fid,'%2.4f; ',values(i));
        end
        fprintf(fid,'%2.4f]; \n\n',values(end));
    catch err %#ok<NASGU>
    end
end

fprintf(fid,'shocks(overwrite);\n');
fprintf(fid,'var %s;\n',shkname);
fprintf(fid,'periods %d:%d;\n',per_init,per_term);
fprintf(fid,'values (x);\n');
fprintf(fid,'end;\n');
fclose(fid);

end
