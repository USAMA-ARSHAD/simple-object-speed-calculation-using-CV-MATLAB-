function x = SpeedCalculation(video,labelled, real_distance, label_value,num_of_frames,fps)
    extracted_label = zeros(size(video));
    for i=1:num_of_frames
        extracted_label(:,:,i) = SeparateLabel(labelled(:,:,i),label_value);
    end
    video = extracted_label;
    area=zeros(1,num_of_frames);
    for i=1:num_of_frames
        area(1,i)= bwarea(video(:,:,i));
    end
    av=mean(area,'All');
    for i=1:num_of_frames
        if bwarea(video(:,:,i))> av
            startframe = i;
            break;
        end
    end
    for i=startframe:num_of_frames
        if bwarea(video(:,:,i))< av
            endframe = i-1;
            break;
        end
    end
    time = abs((endframe-startframe)/fps);
    centroid1 = ComputeCentroid(video(:,:,startframe));
    centroid2 = ComputeCentroid(video(:,:,endframe));
    distance = (centroid1(1,1)-centroid2(1,1))*(centroid1(1,1)-centroid2(1,1));
    distance = distance + (centroid1(1,2)-centroid2(1,2))*(centroid1(1,2)-centroid2(1,2));
    distance = sqrt(distance);
    calliberation_factor = real_distance/distance;
    rd = distance * calliberation_factor;
    %per_pixel_speed = distance/time;
    x = rd/time;
end