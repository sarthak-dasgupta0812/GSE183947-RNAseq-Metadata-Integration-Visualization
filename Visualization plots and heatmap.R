#visualize gene expression (rna_seq) data as bar , scatter , box , density plots and heatmap 
#load libraries 

library(tidyverse)
library(ggplot2)

# data.long to be used here 
#basic format for ggplot2  - ggplot function , first paramenter - data parameter and asthetics(what you want on x axis and what you want on y axis )

#ggplot(data , aes( x =variable , y = variable1)) + # for tidyverse it was pipe operator who was providing the additional info and here in ggplot it is +
# there are different types of plots and visualize and they are the functions of ggplot like  bar , density , dot , histogram , quantile
#geom_col() # used for column plot 

# Bar plot 
data.long %>%
  head()
data.long%>%
  filter(gene == 'TSPAN6') %>% # filter() keeps only the data for the gene TSPAN6
  # All rows for other genes are removed so we can look at TSPAN6 alone
  head()

data.long %>%
  filter(gene == 'TSPAN6') %>% 
  ggplot(., aes( x = samples , y = FPKM )) +   # dot here means that we are taking the data.long in the first dataparameter and samples and FPKM in the x and y axis 
  geom_col()

data.long %>%
  filter(gene == 'TSPAN6') %>% 
  ggplot(., aes( x = samples , y = FPKM , fill = tissue)) + # tissue tells the ggplot to colour the data  
  geom_col()


#density plot - distribution of the expression acorss the tumour tissues and normal tissues 

data.long %>%
  filter(gene =='TSPAN6') %>%
  ggplot(., aes( x = FPKM , fill = tissue)) +
  geom_density()


data.long %>%                                       
  filter(gene =='TSPAN6') %>%
  ggplot(., aes( x = FPKM , fill = tissue)) +
  geom_density(alpha = 0.3)
  
  # alpha (opacity) controls how transparent the bars look in a plot
  # Values range from 0 (fully transparent) to 1 (fully solid)
  # Used to improve visibility when bars overlap or look too dark

# 3 - Box plots - we will be comparing samples having different metastatis status 

data.long%>%
  filter(gene =='TSPAN6') %>%
  ggplot(., aes(x=metastasis , y = FPKM)) +
  geom_boxplot() 

# conversion of box plot to a violin plot 
data.long%>%
  filter(gene =='TSPAN6') %>%
  ggplot(., aes(x=metastasis , y = FPKM)) +
  geom_violin()   # A violin plot shows the distribution of data values across groups, combining density and summary statistics


# 4 - scatterplot  - comparing the expression of two genes - like TSPAN6 and TNMD
#scatterplot 
data.long%>%
  filter(gene =='TSPAN6' | gene == 'TNMD') %>%
  head()
#spread function 
data.long%>%
  filter(gene =='TSPAN6' | gene == 'TNMD') %>% #spread() reshapes data from long format to wide format by turning the values of a column (here, gene) into separate columns and filling them with corresponding values (here, FPKM), so each row contains FPKM values for each gene side-by-side for the same sample.
  spread(key = gene , value = FPKM) %>%
  ggplot(.,aes(x=TSPAN6 , y=TNMD ,color = tissue)) +
  geom_point()+                      ## Plots each sample as a point, showing the relationship between TSPAN6 and TNMD expression
  # in order to fit a straight line 
  geom_smooth(method = "lm" , se = FALSE) #Adds a linear regression line (lm = linear model) without(se = FALSE) the confidence interval shading


# 5 - heatmap  - can used used for visualization of different genes and samples at once 

genes.of.interest <- c('TSPAN6' ,'TNMD','DPM1','SCYL3','C1orf112','FGR')

data.long%>%
  filter(gene%in%genes.of.interest)%>% #%in% is used to filter or check for multiple values at the same time
  head()
#ggplot
data.long%>%
  filter(gene%in%genes.of.interest)%>% 
  ggplot(.,aes(x=samples, y=gene , fill = FPKM))+
  geom_tile() # geom_tile is a function for heatmap , the darker the colour the lower is the expression 

#scale  fill gradient function  - to change the colour scale of this plot 
data.long%>%
  filter(gene%in%genes.of.interest)%>% 
  ggplot(.,aes(x=samples, y=gene , fill = FPKM))+
  geom_tile()+
  scale_fill_gradient(low ='white', high = 'red') #it will create a sort of gradient between the white and red , lower value with white and higher values with red
  # the expression oof SCYL3 is higher compared to all the genes , DPM1 and TNMD are the lowest 


# to save the plot 
p <- data.long%>%
  filter(gene%in%genes.of.interest)%>% 
  ggplot(.,aes(x=samples, y=gene , fill = FPKM))+
  geom_tile()+
  scale_fill_gradient(low ='white', high = 'red') 

ggsave(p, filename= 'heatmap_save1.pdf' , width = 10 , height = 8)

# alternate way 

pdf("heatmap_save2.pdf", width=10 , height = 8)
  data.long%>%
  filter(gene%in%genes.of.interest)%>% 
  ggplot(.,aes(x=samples, y=gene , fill = FPKM))+
  geom_tile()+
  scale_fill_gradient(low ='white', high = 'red') 
  
  dev.off()






 
  
  
                       

  