%% Computing Similarity
%loading data
load data
%normalizing, columnizing training_data
for idx = 1 : size(training_images,3) ;
    temp = double(training_images(:,:,idx));
    training_images_norm(:,:,idx) = temp./max(temp(:));
    temp2 = training_images_norm(:,:,idx);
    training_data(:,idx) = temp2(:);
end
%normalizing, columininzng testing_data
for idx = 1 : size(testing_images,3) ;
    temp = double(testing_images(:,:,idx));
    testing_images_norm(:,:,idx) = temp./max(temp(:));
    temp2 = testing_images_norm(:,:,idx);
    testing_data(:,idx) = temp2(:);
end
%computing similarity for different types
for idx = 1 : 200
    s_1(idx,:) = compute_similarity(training_data,testing_data(:,idx),'type_one');
    s_2(idx,:) = compute_similarity(training_data,testing_data(:,idx),'type_two');
    s_3(idx,:) = compute_similarity(training_data,testing_data(:,idx),'type_three');
end
%% type_one
%Plotting the testing image and its match for type one
count_1 = 0;
for idx = 1 : 200
    [r,c,v] = find(min(s_1(idx,:)) == s_1(idx,:));
    t = 1;
    for idx1 = 1:28:784
        q = 1;
        for idx2 = idx1 : 27+idx1
            temp3(q,t) = training_data(idx2,c);
            temp4(q,t) = testing_data(idx2,idx);
            q = q + 1;
        end
        subplot(211)
        imagesc(temp4)
        colormap(gray(255))
        title('Testing Image')
        subplot(212)
        imagesc(temp3)
        title('Training Image (Image Match)')
        t = t + 1;
    end
    if(testing_labels(idx) == training_labels(c))
        count_1 = count_1 + 1;
    end
    pause(0.3)
end
%finding the accuracy
disp('type_one accuracy')
eff_1 = count_1/2
%% type_two
%Plotting the testing image and its match for type two
count_2 = 0;
for idx = 1 : 200
    [r,c,v] = find(max(s_2(idx,:)) == s_2(idx,:));
    t = 1;
    for idx1 = 1:28:784
        q = 1;
        for idx2 = idx1 : 27+idx1
            temp5(q,t) = training_data(idx2,c(1));
            temp6(q,t) = testing_data(idx2,idx);
            q = q + 1;
        end
        subplot(211)
        imagesc(temp6)
        colormap(gray(255))
        title('Testing Image')
        subplot(212)
        imagesc(temp5)
        title('Training Image (Image Match)')
        t = t + 1;
    end
    if(testing_labels(idx) == training_labels(c))
        count_2 = count_2 + 1;
    end
    pause(0.3)
end
%finding the accuracy
disp('type_two accuracy')
eff_2 = count_2/2
%% type_three
%Plotting the testing image and its match for type three
count_3 = 0;
index = 1;
column = 1;
for idx = 1 : 200
    [r,c,v] = find(max(s_3(idx,:)) == s_3(idx,:));
    t = 1;
    for idx1 = 1:28:784
        q = 1;
        for idx2 = idx1 : 27+idx1
            temp7(q,t) = training_data(idx2,c);
            temp8(q,t) = testing_data(idx2,idx);
            q = q + 1;
        end
        subplot(211)
        imagesc(temp8)
        colormap(gray(255))
        title('Testing Image')
        subplot(212)
        imagesc(temp7)
        title('Training Image (Image Match)')
        t = t + 1;
    end
    if(testing_labels(idx) == training_labels(c))
        count_3 = count_3 + 1;
    end
    pause(0.3)
end
%finding the accuracy
disp('type_three accuracy')
eff_3 = count_3/2
