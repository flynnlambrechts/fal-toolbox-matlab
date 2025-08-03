% latex_matrix - Generates a LaTeX formatted matrix from a given numerical matrix.
%
% Syntax: latex_matrix(A, out)
%
% Inputs:
%   A   - A numerical matrix to be converted into LaTeX format.
%   out - (Optional) Output stream identifier. If not provided, defaults to stdout (1).
%
% Description:
%   This function takes a numerical matrix A and formats it into a LaTeX bmatrix environment.
%   Each element of the matrix is printed with a precision of four decimal places, except for
%   elements that are zero or equal to one (or -1), which are printed as integers.
%   The resulting LaTeX code can be used directly in a LaTeX document to display the matrix.
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