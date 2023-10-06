function ReceivedInstanceFilter(dicom, origin, info)    
    local path = "/lua/"  -- Change this to your desired path
    
    if origin.RemoteAet ~= nil then
        local filename = path .. origin.RemoteAet .. ".txt"
        
        -- Check if the file already exists
        local f = io.open(filename, "r")
        if f then
            -- File exists, close it and do nothing
            f:close()
        else
            -- File doesn't exist, create it and write the AETitle
            local f = io.open(filename, "w")
            if f then
                f:write(origin.RemoteAet)
                f:close()
                print("File created for AETitle:", origin.RemoteAet)
            end
        end
    end

    return true
end
