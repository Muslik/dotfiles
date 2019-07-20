/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   calc.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dmorgil <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/05/16 15:04:02 by dmorgil           #+#    #+#             */
/*   Updated: 2019/05/17 22:23:43 by dmorgil          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <math.h>

int check_level(double level) {
	if (level > 30 || level < 0)
		return (0);
	return (1);
}

int check_tier(double tier) {
	double temp;

	if(modf(tier, &temp))
		return (0);
	else if (tier < 0 || tier > 7)
		return (0);
	return (1);
}

int check_mark(double mark) {
	double temp;

	if(modf(mark, &temp))
		return (0);
	else if (mark < 50 || mark > 125)
		return (0);
	return (1);
}

double calculate(double level, double mark, double tier) {
	double exp_per_lvl[] = {
		0,
		1000,
		2136.3636363636365,
		3427.6859504132235,
		4895.097670924118,
		6562.610989686497,
		8457.51248828011,
		10610.809645772853,
		13057.738233832788,
		15838.338902082713,
		18998.112388730355,
		22588.764078102675,
		26669.05008875304,
		31305.738737219363,
		36574.70311047655,
		42562.16262554153,
		49366.09389266083,
		57097.83396893276,
		65883.9022374236,
		75868.07072434499,
		87213.71673221022,
		100106.49628660252,
		114757.3821438665,
		131406.11607257556,
		150325.13190065406,
		171824.01352347052,
		196254.56082212558,
		224016.54638877907,
		255564.2572599762,
		291413.9287045184,
		332152.19170968,
		-1
	};
	double exp_per_tier[] = {
		2.2,
		8.8330,
		20.02,
		33.88,
		56.10,
		79.2,
		93.50,
		132
	};
	int lvl_int = (int)floor(level);
	double fract = level - lvl_int;
	int max_level = 30;
	int plus_exp = exp_per_tier[(int)tier] * (int)mark + exp_per_lvl[lvl_int] + (exp_per_lvl[lvl_int + 1] - exp_per_lvl[lvl_int]) * fract;
	int index = 0;
	double final_res;

	for (int i = 0; i < max_level; i++) {
		if (exp_per_lvl[i] > plus_exp) {
			i--;
			index = i;
			break;
		}
	}

	final_res = (exp_per_lvl[index + 1] - exp_per_lvl[index]) / 100;
	final_res = ((plus_exp - exp_per_lvl[index]) / final_res) / 100;
	final_res += index;
	if (final_res > 30)
		final_res = 30;
	return final_res;
}

int main() {
	double mark;
	double tier;
	double level;
	do {
		printf("\e[34mEnter your level [0-30]: \e[0m");
		scanf("%lf", &level);
		if (!check_level(level))
			printf("\e[31mError. Level must be between 0 and 30\e[0m\n");
	}
	while (!check_level(level));
	do {
		printf("\e[34mEnter project mark [50-125]: \e[0m");
		scanf("%lf", &mark);
		if (!check_mark(mark))
			printf("\e[31mError. Mark must be an integer value between 50 and 125\e[0m\n");
	}
	while (!check_mark(mark));
	do {
		printf("\e[34mEnter project tier [0-7]: \e[0m");
		scanf("%lf", &tier);
		if (!check_tier(tier))
			printf("\e[31mError. Tier must be an integer value between 0 and 7\e[0m\n");
	}
	while (!check_tier(tier));
	printf("\e[32mYOUR FINAL LEVEL ==> %.2lf\e[0m\n", calculate(level, mark, tier));
}
