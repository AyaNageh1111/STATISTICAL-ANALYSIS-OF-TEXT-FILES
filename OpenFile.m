function OpenFile(filename,n)
s=importdata(filename);
str=upper(s(:));
str=[str{:}];
AZ='A':'Z';
longs=sum(ismember(str,AZ));
k=0;
Let =[];
global let;
let=0;

for k=1:26
    if n==1
        let=sum(ismember(str,AZ(k)));
        Let(k)=let;
        stem(Let/longs);
        xticks(0:1:26);
        xlabel('Letters');

    elseif n==2
        let=sum(ismember(str,AZ(k)))+let;
        Let(k)=let;
        stairs(Let/longs);
        xticks(0:1:26);
        xlabel('Letters');

    elseif n==10
        let=sum(ismember(str,AZ(k)));
        Let(k)=let;
        stem(Let/longs);
        xticks(0:1:26);
        xlabel('Letters');
        xticklabels({'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z'});


    end



    %ylabel('No. of repetition');
    if (n==1)
        ylabel('PDF');
    end
    if (n==2)
        ylabel('CDF');
    end
    if (n==10)
        ylabel('Probability of each character');
    end
    % title('Traffic Counts at Three Intersections')
    xticks([1:26]);

    if n==3
        for k=1:26
            let=sum(ismember(str,AZ(k)));
            Let(k)=let;
        end
        B=maxk(Let, 5);
        D=Let;
        D( (D~=B(1)) & (D~=B(2)) &  (D~=B(3)) & (D~=B(4)) & (D~=B(5))  )=nan;
        stem(D);
        xlabel('Letters');
        ylabel('Number of repetition');
        xticks([1:26]);
        xticklabels({'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z'});
    end


end