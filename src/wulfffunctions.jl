function wulffproject(NormalVectors)
#=
=#
end

function NormalizeAll!(NormalVectors,projectaxis=:z)
#=
    normalize all the vectors and make them point to the outside of the sphere.
=#
    NormsVec = sqrt.(NormalVectors[:,1].^2+NormalVectors[:,2].^2+NormalVectors[:,3].^2);
    NormalVectors = NormalVectors./NormsVec;

    if projectaxis==:z
        ReverseLoc = findall(NormalVectors[:,3].>0.0);
    elseif projectaxis==:x
        ReverseLoc = findall(NormalVectors[:,1].>0.0);
    elseif projectaxis==:y
        ReverseLoc = findall(NormalVectors[:,2].>0.0);
    end

    NormalVectors[ReverseLoc,:] = -NormalVectors[ReverseLoc,:];

end

function 