function latex_matrix(A, out)
    if nargin < 2
        out = 1; % default to stdout
    end

    fprintf(out, "\\begin{bmatrix}\n");
    for i = 1:size(A, 1)
        fprintf(out, "\t");
        for j = 1:size(A, 2)
            if round(A(i, j), 4) == 0 || abs(round(A(i, j), 4)) == 1
                fprintf(out, "%d", round(A(i, j)));
            else
                fprintf(out, "%.4f", A(i, j));
            end

            if j ~= size(A, 2)
                fprintf(out, " & ");
            end
        end
        fprintf(out, " \\\\\n");
    end
    fprintf(out, "\\end{bmatrix}\n");
end