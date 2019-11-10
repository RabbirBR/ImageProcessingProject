%% Setting Initial Parameters
clear
clc

harris_params = containers.Map;
harris_params('sigma') = 1;
harris_params('threshold') = 0.05;
harris_params('radius') = 2;

sift_params = containers.Map;
sift_params('radius') = 2;
sift_params('enlarge_factor') = 1.5;

num_putative_matches = 200;
num_ransac_iter = 5000;


folder_name = "images\Bridge";
img_format = 'png';

res = image_mosiac(folder_name,...
    img_format, harris_params, sift_params, num_putative_matches,...
    num_ransac_iter, 1);
% imshow(res);


%% Iterating for House3
house3_results = [];

if ~exist('output_images/house3/', 'dir')
   mkdir('output_images/house3/');
end

folder_name = "images\House3";
img_format = 'png';

n = 1;
for i = 1:0.5:3
    for j = 0.01:0.01:0.1
        for k = 1:1:3
            for l = 1:1:3
                i = i
                j = j
                k = k
                l = l
                
                try
                    harris_params('sigma') = i;
                    harris_params('threshold') = j;
                    harris_params('radius') = k;
                    sift_params('radius') = l;

                    res = image_mosiac(folder_name,...
                        img_format, harris_params, sift_params, num_putative_matches,...
                        num_ransac_iter, 2);
                    imshow(res);
                    
                    output_file_path = "output_images/house3/" + int2str(n);
                    output_file_path = output_file_path+"."+img_format;
                    imwrite(res, output_file_path);

                    vals = [folder_name i j k l output_file_path];
                    house3_results = [house3_results; vals];
                    n = n + 1
                end
            end
        end
    end
end

fid = fopen( 'CSVs/house3_results.csv', 'wt' );
writematrix(house3_results, 'CSVs/house3_results.csv');
fclose(fid);



%% Iterating for House1
house1_results = [];

folder_name = "images\House1";
img_format = 'png';

if ~exist("output_images/house1/", "dir")
   mkdir("output_images/house1/");
end

n = 1;
for i = 1:0.5:3
    for j = 0.01:0.01:0.1
        for k = 1:1:3
            for l = 1:1:3
                i = i
                j = j
                k = k
                l = l
                
                try
                    harris_params('sigma') = i;
                    harris_params('threshold') = j;
                    harris_params('radius') = k;
                    sift_params('radius') = l;

                    res = image_mosiac(folder_name,...
                        img_format, harris_params, sift_params, num_putative_matches,...
                        num_ransac_iter, 2);
                    imshow(res);

                    
                    output_file_path = "output_images/house1/" + int2str(n);
                    output_file_path = output_file_path+"."+img_format;
                    imwrite(res, output_file_path);

                    vals = [folder_name i j k l output_file_path];
                    house1_results = [house1_results; vals];
                    n = n + 1;
                end
            end
        end
    end
end

fid = fopen( 'CSVs/house1_results.csv', 'wt' );
writematrix(house1_results, 'CSVs/house1_results.csv');
fclose(fid);


%% Iterating for House2
house2_results = [];

folder_name = "images\House2";
img_format = 'png';

if ~exist("output_images/house2/", "dir")
   mkdir("output_images/house2/");
end

n = 1;
for i = 1:0.5:3
    for j = 0.01:0.01:0.1
        for k = 1:1:3
            for l = 1:1:3
                i = i
                j = j
                k = k
                l = l
                
                try
                    harris_params('sigma') = i;
                    harris_params('threshold') = j;
                    harris_params('radius') = k;
                    sift_params('radius') = l;

                    res = image_mosiac(folder_name,...
                        img_format, harris_params, sift_params, num_putative_matches,...
                        num_ransac_iter, 2);
                    imshow(res);

                    
                    output_file_path = "output_images/house2/" + int2str(n);
                    output_file_path = output_file_path+"."+img_format;
                    imwrite(res, output_file_path);

                    vals = [folder_name i j k l output_file_path];
                    house2_results = [house2_results; vals];
                    n = n + 1;
                end
            end
        end
    end
end

fid = fopen( 'CSVs/house2_results.csv', 'wt' );
writematrix(house2_results, 'CSVs/house2_results.csv');
fclose(fid);

%% Iterating for Paris Bridge
bridge_results = [];

folder_name = "images\Bridge";
img_format = 'png';

if ~exist("output_images/bridge/", "dir")
   mkdir("output_images/bridge/");
end

n = 1;
for i = 1:0.5:3
    for j = 0.01:0.01:0.1
        for k = 1:1:3
            for l = 1:1:3
                i = i
                j = j
                k = k
                l = l
                
                try
                    harris_params('sigma') = i;
                    harris_params('threshold') = j;
                    harris_params('radius') = k;
                    sift_params('radius') = l;

                    res = image_mosiac(folder_name,...
                        img_format, harris_params, sift_params, num_putative_matches,...
                        num_ransac_iter, 2);
                    imshow(res);

                    
                    output_file_path = "output_images/bridge/" + int2str(n);
                    output_file_path = output_file_path+"."+img_format;
                    imwrite(res, output_file_path);

                    vals = [folder_name i j k l output_file_path];
                    bridge_results = [bridge_results; vals];
                    n = n + 1;
                end
            end
        end
    end
end

fid = fopen( 'CSVs/bridge_results.csv', 'wt' );
writematrix(bridge_results, 'CSVs/bridge_results.csv');
fclose(fid);


%% Iterating for Eifel Tower 1
eifel_tower_results = [];

folder_name = "images\Tower";
img_format = 'png';

if ~exist("output_images/eifel_tower/", "dir")
   mkdir("output_images/eifel_tower/");
end

n = 1;
for i = 1:0.5:3
    for j = 0.01:0.01:0.1
        for k = 1:1:3
            for l = 1:1:3
                i = i
                j = j
                k = k
                l = l
                
                try
                    harris_params('sigma') = i;
                    harris_params('threshold') = j;
                    harris_params('radius') = k;
                    sift_params('radius') = l;

                    res = image_mosiac(folder_name,...
                        img_format, harris_params, sift_params, num_putative_matches,...
                        num_ransac_iter, 2);
                    imshow(res);

                    
                    output_file_path = "output_images/eifel_tower/" + int2str(n);
                    output_file_path = output_file_path+"."+img_format;
                    imwrite(res, output_file_path);

                    vals = [folder_name i j k l output_file_path];
                    eifel_tower_results = [eifel_tower_results; vals];
                    n = n + 1;
                end
            end
        end
    end
end

fid = fopen( 'CSVs/eifel_tower_results.csv', 'wt' );
writematrix(eifel_tower_results, 'CSVs/eifel_tower_results.csv');
fclose(fid);


%% Iterating for Eifel Tower 2
eifel_tower_2_results = [];

folder_name = "images\EifelTower1";
img_format = 'jpg';

if ~exist("output_images/eifel_tower_2/", "dir")
   mkdir("output_images/eifel_tower_2/");
end

n = 1;
for i = 1:0.5:3
    for j = 0.01:0.01:0.1
        for k = 1:1:3
            for l = 1:1:3
                i = i
                j = j
                k = k
                l = l
                
                try
                    harris_params('sigma') = i;
                    harris_params('threshold') = j;
                    harris_params('radius') = k;
                    sift_params('radius') = l;

                    res = image_mosiac(folder_name,...
                        img_format, harris_params, sift_params, num_putative_matches,...
                        num_ransac_iter, 2);
                    imshow(res);

                    
                    output_file_path = "output_images/eifel_tower_2/" + int2str(n);
                    output_file_path = output_file_path+"."+img_format;
                    imwrite(res, output_file_path);

                    vals = [folder_name i j k l output_file_path];
                    eifel_tower_2_results = [eifel_tower_2_results; vals];
                    n = n + 1;
                end
            end
        end
    end
end

fid = fopen('CSVs/eifel_tower_2_results.csv', 'wt');
writematrix(eifel_tower_2_results, 'CSVs/eifel_tower_2_results.csv');
fclose(fid);


%% Iterating for OddaNorway
odda_norway_results = [];

folder_name = "images\OddaNorway";
img_format = 'jpg';

if ~exist("output_images/odda_norway/", "dir")
   mkdir("output_images/odda_norway/");
end

n = 1;
for i = 1:0.5:3
    for j = 0.01:0.01:0.1
        for k = 1:1:3
            for l = 1:1:3
                i = i
                j = j
                k = k
                l = l
                
                try
                    harris_params('sigma') = i;
                    harris_params('threshold') = j;
                    harris_params('radius') = k;
                    sift_params('radius') = l;

                    res = image_mosiac(folder_name,...
                        img_format, harris_params, sift_params, num_putative_matches,...
                        num_ransac_iter, 2);
                    imshow(res);

                    
                    output_file_path = "output_images/odda_norway/" + int2str(n);
                    output_file_path = output_file_path+"."+img_format;
                    imwrite(res, output_file_path);

                    vals = [folder_name i j k l output_file_path];
                    odda_norway_results = [odda_norway_results; vals];
                    n = n + 1;
                end
            end
        end
    end
end

fid = fopen( 'CSVs/odda_norway_results.csv', 'wt' );
writematrix(odda_norway_results, 'CSVs/odda_norway_results.csv');
fclose(fid);


%% Iterating for Chernobyl
chernobyl_results = [];

folder_name = "images\Chernobyl";
img_format = 'jpg';

if ~exist("output_images/chernobyl/", "dir")
   mkdir("output_images/chernobyl/");
end

n = 1;
for i = 1:0.5:3
    for j = 0.01:0.01:0.1
        for k = 1:1:3
            for l = 1:1:3
                i = i
                j = j
                k = k
                l = l
                
                try
                    harris_params('sigma') = i;
                    harris_params('threshold') = j;
                    harris_params('radius') = k;
                    sift_params('radius') = l;

                    res = image_mosiac(folder_name,...
                        img_format, harris_params, sift_params, num_putative_matches,...
                        num_ransac_iter, 2);
                    imshow(res);

                    
                    output_file_path = "output_images/chernobyl/" + int2str(n);
                    output_file_path = output_file_path+"."+img_format;
                    imwrite(res, output_file_path);

                    vals = [folder_name i j k l output_file_path];
                    chernobyl_results = [chernobyl_results; vals];
                    n = n + 1;
                end
            end
        end
    end
end

fid = fopen( 'CSVs/chernobyl_results.csv', 'wt' );
writematrix(chernobyl_results, 'CSVs/chernobyl_results.csv');
fclose(fid);


%% Iterating for DresdenGermany
dresden_germany_results = [];

folder_name = "images\DresdenGermany";
img_format = 'jpg';

if ~exist("output_images/dresden_germany/", "dir")
   mkdir("output_images/dresden_germany/");
end

n = 1;
for i = 1:0.5:3
    for j = 0.01:0.01:0.1
        for k = 1:1:3
            for l = 1:1:3
                i = i
                j = j
                k = k
                l = l
                
                try
                    harris_params('sigma') = i;
                    harris_params('threshold') = j;
                    harris_params('radius') = k;
                    sift_params('radius') = l;

                    res = image_mosiac(folder_name,...
                        img_format, harris_params, sift_params, num_putative_matches,...
                        num_ransac_iter, 2);
                    imshow(res);

                    
                    output_file_path = "output_images/dresden_germany/" + int2str(n);
                    output_file_path = output_file_path+"."+img_format;
                    imwrite(res, output_file_path);

                    vals = [folder_name i j k l output_file_path];
                    dresden_germany_results = [dresden_germany_results; vals];
                    n = n + 1;
                end
            end
        end
    end
end

fid = fopen( 'CSVs/dresden_germany_results.csv', 'wt' );
writematrix(dresden_germany_results, 'CSVs/dresden_germany_results.csv');
fclose(fid);

%% Iterating for ShepherdGlacier
shepherd_glacier_results = [];

folder_name = "images\ShepherdGlacier";
img_format = 'jpg';

if ~exist("output_images/shepherd_glacier/", "dir")
   mkdir("output_images/shepherd_glacier/");
end

n = 1;
for i = 1:0.5:3
    for j = 0.01:0.01:0.1
        for k = 1:1:3
            for l = 1:1:3
                i = i
                j = j
                k = k
                l = l
                
                try
                    harris_params('sigma') = i;
                    harris_params('threshold') = j;
                    harris_params('radius') = k;
                    sift_params('radius') = l;

                    res = image_mosiac(folder_name,...
                        img_format, harris_params, sift_params, num_putative_matches,...
                        num_ransac_iter, 2);
                    imshow(res);

                    
                    output_file_path = "output_images/shepherd_glacier/" + int2str(n);
                    output_file_path = output_file_path+"."+img_format;
                    imwrite(res, output_file_path);

                    vals = [folder_name i j k l output_file_path];
                    shepherd_glacier_results = [shepherd_glacier_results; vals];
                    n = n + 1;
                end
            end
        end
    end
end

fid = fopen( 'CSVs/shepherd_glacier_results.csv', 'wt' );
writematrix(shepherd_glacier_results, 'CSVs/shepherd_glacier_results.csv');
fclose(fid);

%% Iterating for St. Matthews Church
matthew_results = [];

folder_name = "images\St_Matthew";
img_format = 'jpg';

if ~exist("output_images/matthew/", "dir")
   mkdir("output_images/matthew/");
end

n = 1;
for i = 1:0.5:3
    for j = 0.01:0.01:0.10
        for k = 1:1:3
            for l = 1:1:3
                i = i
                j = j
                k = k
                l = l
                
                try
                    harris_params('sigma') = i;
                    harris_params('threshold') = j;
                    harris_params('radius') = k;
                    sift_params('radius') = l;

                    res = image_mosiac(folder_name,...
                        img_format, harris_params, sift_params, num_putative_matches,...
                        num_ransac_iter, 2);
                    imshow(res);

                    
                    output_file_path = "output_images/matthew/" + int2str(n);
                    output_file_path = output_file_path+"."+img_format;
                    imwrite(res, output_file_path);

                    vals = [folder_name i j k l output_file_path];
                    matthew_results = [matthew_results; vals];
                    n = n + 1;
                end
            end
        end
    end
end

fid = fopen( 'CSVs/matthew_results.csv', 'wt' );
writematrix(matthew_results, 'CSVs/matthew_results.csv');
fclose(fid);