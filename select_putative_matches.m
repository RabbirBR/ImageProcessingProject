function [m1, m2] = select_putative_matches(d1, d2, num)
    d1 = zscore(d1')';
    d2 = zscore(d2')';
    
    distance = dist(d1,d2);
    
    [h,w] = size(distance);
    
    % Lowe's ratio test
    m1 = [];
    m2 = [];
    for i = 1:h
        [~,idx]= sort(distance(i,:));
        if distance(i,idx(1))/distance(i,idx(2)) < 0.5
            m1 = [m1;i];
            m2 = [m2;idx(1)];
            if length(m1) == num
                break;
            end
        end
    end
end

