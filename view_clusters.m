% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
	scatter3(centroids(:, 1),centroids(:, 2),centroids(:,3) ,45,centroids(:,3));
  scatter3(points(:, 1), points(:, 2), points(:, 3), 20, [0 0 0 ]);
end

