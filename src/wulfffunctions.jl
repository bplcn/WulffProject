function wulffproject(NormalVectors;projectaxis=:z)
#=
=#
    # normalize the input
    NormalVectors = NormalizeAll(NormalVectors,projectaxis=projectaxis);
    nVecs = size(NormalVectors,1);

    # pola coordinate
    if projectaxis==:z
        PolaCoord = [0.0;0.0;1.0];
    elseif projectaxis==:x
        PolaCoord = [1.0;0.0;0.0];
    elseif  projectaxis==:y
        PolaCoord = [1.0;0.0;0.0];
    end

    PointVecs = NormalVectors.-ones(nVecs)*transpose(PolaCoord);
    if projectaxis==:z
        PointProjected = ones(nVecs)*transpose(PolaCoord)-PointVecs./(PointVecs[:,3]*[1.0 1.0 1.0]);
    elseif projectaxis==:x
        PointProjected = ones(nVecs)*transpose(PolaCoord)-PointVecs./(PointVecs[:,1]*[1.0 1.0 1.0]);
    elseif  projectaxis==:y
        PointProjected = ones(nVecs)*transpose(PolaCoord)-PointVecs./(PointVecs[:,2]*[1.0 1.0 1.0])
    end

    return PointProjected
end

function NormalizeAll(NormalVectors;projectaxis=:z)
#=
    normalize all the vectors and make them point to the -z
=#
    # normalization
    NormsVec = sqrt.(NormalVectors[:,1].^2+NormalVectors[:,2].^2+NormalVectors[:,3].^2);
    NormalVectors = NormalVectors./(NormsVec*[1.0 1.0 1.0]);

    # reverse the vector that point 
    if projectaxis==:z
        ReverseLoc = findall(NormalVectors[:,3].>0.0);
    elseif projectaxis==:x
        ReverseLoc = findall(NormalVectors[:,1].>0.0);
    elseif projectaxis==:y
        ReverseLoc = findall(NormalVectors[:,2].>0.0);
    end

    NormalVectors[ReverseLoc,:] = -NormalVectors[ReverseLoc,:];
    return NormalVectors
end
