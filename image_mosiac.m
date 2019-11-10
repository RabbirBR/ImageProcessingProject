function [result] = image_mosiac(folder_name, img_format, harris_params, sift_params, num_putative_matches, num_ransac_iter, stage)
    
    folder_images = dir(strcat(folder_name, "\*.", img_format));
    images = {};
    images_grey = {};
    harris_points = {};
    sift_discriptors = {};
    XY = {};
    
    
    % Find and calculate sift discriptors.
    for i = 1:length(folder_images)
        img_loc = strcat(folder_images(i).folder, '\', folder_images(i).name);
        images{i} = imread(img_loc);
        images_grey{i} = im2double(rgb2gray(imread(img_loc)));
        
        [r, c] = harris(...
            images_grey{i},...
            harris_params('sigma'),...
            harris_params('threshold'),...
            harris_params('radius'), lt(stage, 2));
        
        harris_points{i}{'r'} = r;
        harris_points{i}{'c'} = c;
        
        sift_discriptors{i} = find_sift(...
            images_grey{i},...
            [c, r, sift_params('radius')*ones(length(c),1)],...
            sift_params('enlarge_factor'));
    end
    matches = {};
    
    [matches{1}, matches{2}] = select_putative_matches(...
        sift_discriptors{1}, sift_discriptors{2}, num_putative_matches);
    
    XY{1} = [harris_points{1}{'c'}(matches{1}), harris_points{1}{'r'}(matches{1})];
    XY{2} = [harris_points{2}{'c'}(matches{2}), harris_points{2}{'r'}(matches{2})];
%     disp(length(XY{1}))
%     disp(length(XY{2}))
    
    [H, num_inliers, residual] = ransac(XY{1}, XY{2}, num_ransac_iter,...
        @homography_fit,@homography_tf);
    
    result = stitchH(images{1}, H, images{2});
end