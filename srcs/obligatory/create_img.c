#include "cub3d.h"

int		create_image(t_all **all)
{
	if ((*all)->img.ptr != NULL)
	{
		mlx_destroy_image((*all)->mlx, (*all)->img.ptr);
		mlx_clear_window((*all)->mlx, (*all)->win);
		(*all)->img.ptr = NULL;
	}
	(*all)->img.ptr = mlx_new_image((*all)->mlx, (*all)->r[X], (*all)->r[Y]);
	(*all)->img.bpp = 32;
	(*all)->img.size_line = (*all)->r[X] * 4;
	(*all)->img.endian = 0;
	(*all)->img.data = (int *)mlx_get_data_addr((*all)->img.ptr, &(*all)->img.bpp, &(*all)->img.size_line, &(*all)->img.endian);
	(*all)->grid.column = 0;
	ft_wall(all);
	print_sprite(all, &(*all)->sp);
	mlx_put_image_to_window((*all)->mlx, (*all)->win, (*all)->img.ptr, 0, 0);
	ft_move(all);
	return (NO_ERR);
}
