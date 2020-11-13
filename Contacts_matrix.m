sample_size = 150;
contact_tracing = rand(sample_size, sample_size);
for i = 1:sample_size
    contact_tracing(i, i) = 0;
    for j = i + 1:sample_size
        if contact_tracing(i, j) > 0.2
            contact_tracing(i, j) = 0;
            contact_tracing(j, i) = 0;
        else
            contact_tracing(i, j) = 1;
            contact_tracing(j,i) = 1;
        end    
    end
end

contact_tracing = contact_tracing./sum(contact_tracing, 2);
graph = digraph(contact_tracing);
p = plot(graph);
p.Marker = 's';
p.NodeColor = 'r'
