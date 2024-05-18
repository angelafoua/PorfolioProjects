select * 
from DataExploration..CovidDeaths
order by 3, 4

--select * 
--from DataExploration..CovidVaccinations
--order by 3, 4

select location, date, total_cases, new_cases, total_deaths, population
from DataExploration..CovidDeaths
order by 1, 2


--Looking at Total cases vd Total deaths
--shows the likelihood of dying if you contract covid in the cote d'ivoire for instance
select location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 as Percentageofdeaths
from DataExploration..CovidDeaths
where location like '%cote%'
order by 1, 2


--  Looking at the total cases vs Population
--  shows what percentage of population got covid
select location, date, Population, total_cases, (total_cases/population)*100 as Percentageofdeaths
from DataExploration..CovidDeaths
where location like '%state%'
order by 1, 2

--looking at countries with highest infection rate  per pupulation
select location, Population, Max(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentageofpopulationInfected
from DataExploration..CovidDeaths
--where location like '%state%'
group by location, Population
order by PercentageofpopulationInfected desc


