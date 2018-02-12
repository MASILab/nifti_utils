function success = are_compatible(nii1_path,nii2_path)
    % Tests to see if input niftis are compatible. If they are compatible, 
    % then they can be concatenated as long as the datatype, bitpix, 
    % scl_slope, and scl_inter are taken into account.

    [nii1_hdr,~,~,nii1_machine] = load_untouch_header_only(nii1_path);   
    [nii2_hdr,~,~,nii2_machine] = load_untouch_header_only(nii2_path);   

    if isequal(nii1_machine,nii2_machine) && ...
       isequal(nii1_hdr.dime.dim(2:4),nii2_hdr.dime.dim(2:4)) && ...
       isequal(nii1_hdr.dime.pixdim(1:4),nii2_hdr.dime.pixdim(1:4)) && ...
       nii1_hdr.dime.xyzt_units == nii2_hdr.dime.xyzt_units && ...
       nii1_hdr.hist.qform_code == nii2_hdr.hist.qform_code && ...
       nii1_hdr.hist.quatern_b == nii2_hdr.hist.quatern_b && ...
       nii1_hdr.hist.quatern_c == nii2_hdr.hist.quatern_c && ...
       nii1_hdr.hist.quatern_d == nii2_hdr.hist.quatern_d && ...
       nii1_hdr.hist.qoffset_x == nii2_hdr.hist.qoffset_x && ...
       nii1_hdr.hist.qoffset_y == nii2_hdr.hist.qoffset_y && ...
       nii1_hdr.hist.qoffset_z == nii2_hdr.hist.qoffset_z && ...
       nii1_hdr.hist.sform_code == nii2_hdr.hist.sform_code && ...
       isequal(nii1_hdr.hist.srow_x,nii2_hdr.hist.srow_x) && ...
       isequal(nii1_hdr.hist.srow_y,nii2_hdr.hist.srow_y) && ...
       isequal(nii1_hdr.hist.srow_z,nii2_hdr.hist.srow_z) && ...
       isequal(nii1_hdr.hist.magic,nii2_hdr.hist.magic)
        success = true;
    else
        success = false;
    end               
end