/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_free.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/05/29 16:41:35 by adbenoit          #+#    #+#             */
/*   Updated: 2020/05/30 21:30:41 by adbenoit         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "cub3d.h"

void	free_tab_char(char **ptr)
{
	int i;

	if (ptr != 0)
	{
		i = 0;
		while (ptr[i])
		{
			free(ptr[i]);
			i++;
		}
		free(ptr);
		ptr = NULL;
	}
}

void	free_tab_nb(void **ptr, int size)
{
	int i;

	if (ptr != 0)
	{
		i = 0;
		while (i < size)
		{
			free(ptr[i]);
			i++;
		}
		free(ptr);
		ptr = NULL;
	}
}
