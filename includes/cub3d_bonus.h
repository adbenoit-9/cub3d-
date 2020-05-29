/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cub3d_bonus.h                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/05/29 14:58:52 by Adeline           #+#    #+#             */
/*   Updated: 2020/05/29 15:14:15 by adbenoit         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef CUB3D_BONUS_H
# define CUB3D_BONUS_H

# include "cub3d.h"
# include "cub3d_macros_bonus.h"

void			draw_mini_map(t_all **all);
void			check_door(t_all **all);
void			draw_all_sprites(t_all **all, t_sprite *sp);
void			draw_door(t_all **all);
void			draw_hearts(t_all **all);
void			draw_replay(t_all **all, t_img *im, int k1, int k2);
void			draw_weapon(t_all **all);
void			manage_life(t_all **all, char c);
void			open_door(t_all **all);
int				ft_mouse(int button, int x, int y, t_all **all);

#endif