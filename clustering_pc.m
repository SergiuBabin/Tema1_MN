
function centroids = clustering_pc(points, NC)
points_col = length(points(1,:));
points_lin   = length(points(:,1));

p_min = min(points);
p_max = max(points);
p_diff = p_max .- p_min ;

centroids = ones(NC, points_col) .* rand(NC, points_col);
for i=1 : 1 : length(centroids(:,1))
  centroids( i , : ) = centroids( i , : ).* p_diff;
  centroids( i , : ) = centroids( i , : )+ p_min;
end

  pos_diff = 1.;

while pos_dif > 0.0
  Vect = [];
  for i=1:length(points(:, 1));

    min_dif = ( points( i, :) .- centroids( 1,:) );
    min_dif = min_dif * min_dif';
    curAssignment = 1;

    for j = 2 : NC;
      dif2c = ( points( i, :) .- centroids( j,:) );
      dif2c = dif2c * dif2c';
      if( min_dif >= dif2c)
        curAssignment = j;
        min_dif = dif2c;
      end
    end

    assignment = [ assignment; curAssignment];
  end
  oldPositions = centroids;
  centroids = zeros(NC, points_col);
  pointsInCluster = zeros(NC, 1);
  
  for d = 1: length(assignment);
    centroids( assignment(d),:) += points(d,:);
    pointsInCluster( assignment(d), 1 )++;
  end

  for c = 1: NC;
    if( pointsInCluster(c, 1) != 0)
      centroids( c , : ) = centroids( c, : ) / pointsInCluster(c, 1);
    else
      centroids( c , : ) = (rand( 1, points_col) .* p_dif) + p_min;
    end
  end
  pos_dif = sum (sum( (centroids .- oldPositions).^2 ) );

end
