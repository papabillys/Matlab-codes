function output = echo_gen(input, fs, delay, amp)
    
    % Input is a column vector with values between -1 and 1. 
    % It represents a time series of digitized sound data. 
    
    % fs is the sampling rate. It specifies the number of samples per sec.
    
    % delay after how many secs echo starts. 
    
    % amp specifies the volume of the echo, normally <1. 
    
    % use sound(y,Fs) to listen the sound
    
    starting_point = round(delay*fs); 
    total_size = length(input) + starting_point; 
    temp = zeros(total_size,1); % The output matrix. 

    % We need amp>0 else cannot produce echo. 
    if amp<0 
        error("Possitive value\n"); 
    end
    
    
    for i = 1:total_size
       if i <= starting_point % Not apply echo here.
           if i<=length(input) 
               temp(i) = input(i);
           else % Sound is smaller than delay in secs. 
               temp(i) = 0; 
           end
       else 
           if i <= length(input) % Start applying the echo. 
               if amp<=1 
                    temp(i) = input(i) + amp*input(i-starting_point);  
               else % If amp > 1 , original sound is covered, so calculate just the echo. 
                   temp(i) = amp*input(i-starting_point);
               end
           else % Apply echo input sound ends. 
               temp(i) = amp*input(i-starting_point); 
           end
       end
    end

    
    % Normalize values if needed. 
    max_element = max(abs(temp));
    if max_element > 1 
        for i = 1:length(temp)
           temp(i) = temp(i) / max_element; 
        end        
    end
    output = temp;
        
end

