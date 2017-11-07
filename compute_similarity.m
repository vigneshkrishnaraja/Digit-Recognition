function s = compute_similarity(training_data, test_data, type);
%Syntax:- test_number(n);
%
% This function computes the similarity of the training data and the
% testing data vector according to the type.
%
% Input Arguments: training_data - vectors training_data set
%                   test_data - column vector of testing_data
%                   type - string indicating the type
%                         
%
% Output: s - vector of the distances i.e. the similarity of each image in
%             the training_data with test_data.
%
% Author: Vignesh Krishnaraja
% University of Dayton, Class of 2018
if(~iscolumn(test_data))
    error('test_data must be 1D vector')
end

if(strcmp(type,'type_one'))
    for idx = 1 : 60000
        s(idx) = 0;
        for idx2 = 1 : 784
            s(idx) = s(idx) + sqrt((training_data(idx2,idx) - test_data(idx2)).^2);
        end
    end   
elseif(strcmp(type,'type_two'))
    for idx = 1 : 60000
        s(idx) = 0;
        t1 = 0;
        t2 = 0;
        for idx2 = 1 : 784
            t1 = t1 + min(training_data(idx2,idx),test_data(idx2));
            t2 = t2 + training_data(idx2,idx);
        end
        s(idx) = t1/t2;
    end
elseif(strcmp(type,'type_three'))
    for idx = 1 : 60000
        s(idx) = 0;
        t1 = 0;
        t2 = 0;
        t3 = 0;
        for idx2 = 1: 784
            t1 = t1 + training_data(idx2,idx)*test_data(idx2); 
            t2 = t2 + training_data(idx2,idx)^2;
            t3 = t3 + test_data(idx2)^2;
        end
        s(idx) = t1/(sqrt(t2) * sqrt(t3));
    end
end
