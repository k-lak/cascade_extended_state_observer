function [out] = sat(x)
    out = min(max(x, -1), 1);
end

