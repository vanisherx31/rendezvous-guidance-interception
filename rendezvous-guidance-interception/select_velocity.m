function vcmd = select_velocity(vRT, vRTmax, FVR)

FVRpoly = polyshape(FVR(:,1),FVR(:,2));

RS = [vRT; vRTmax];

if isinterior(FVRpoly, vRTmax(1), vRTmax(2))
    vcmd = vRTmax;
else
    vcmd = vRT;
end

end
