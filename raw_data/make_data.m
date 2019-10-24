clc;
clearvars;
close all;

data = [];

root = 'D:\JanneK\Documents\git_repos\NLP_introduction\';

for path0 = {'TERVEYS','TALOUS'}
    path = [root,path0{1}];    
    d = dir(path);
    for i = 1:length(d)
        if d(i).isdir==0
            f = fopen([path,filesep,d(i).name],'r','n','utf-8');
            g = textscan(f,'%s','delimiter','\n');
            text = [];
            for k=1:length(g{1})
                text = [text,' ',g{1}{k}];
            end
            fclose(f);        
            text = replace(text,sprintf('\t'),' ');
            data{end+1,1} = text;           
            data{end,2} = path0{1};
        end
    end    
end

fout = fopen('wikipedia_toydata_FIN.txt','w','n','utf-8');
for k = 1:size(data,1)
   fprintf(fout,sprintf('%s\t%s\n',data{k,2},data{k,1}));   
end
fclose(fout);
