#setwd('E:/Hai_Windows/work/DLSensitivity/code')
setup1.train=numeric(54000)
for(j in 1:1000)
{
  setup1.train[((j-1)*54+1):(j*54)]=as.matrix(read.table(paste('./result/MNIST_DenseNet121_128_best_setup1_part',j,'_train.txt',sep='') ))
}

label=scan("MNIST_train_label.txt")

label.conti=numeric(54000)

for(i in 0:9){
  n_i = sum(label==i)
  label.conti[label==i]=head(seq(i,i+1,by=1/n_i),-1)
}

save.data=cbind(setup1.train,label.conti)
write.table(save.data,'setup1_MNIST_DenseNet121_manhattan.txt',sep=' ',row.names = F,
            col.names = F)


which(setup1.train%in%tail(sort(setup1.train),5))#top 5 with largest FI
#23874 31209 35746 41474 49160