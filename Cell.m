function cell = Cell(Data,area_size,se_size)
cell = Data;
se = strel('disk',se_size);
for i = 1:size(Data,3)
    Data(:,:,i) = imerode(Data(:,:,i),se);
    Data(:,:,i) = imdilate(Data(:,:,i),se);
    cell = bwareaopen(Data,area_size);%将目标图像中面积小于area_size的部分去掉
end