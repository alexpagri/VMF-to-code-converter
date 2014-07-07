i=0;
k=0;
do
  {
  str=file_text_read_string(fileid);
  file_text_readln(fileid);
  if(string_count("solid", str)==1)
                  {
                  global.l++;
                  i=0;
                  do
                    {
                    str2=file_text_read_string(fileid);
                    file_text_readln(fileid);
                    if(string_count("side", str2))
                                    {
                                    i++;
                                    for(j=1;j<=2;j++)file_text_readln(fileid);
                                    //do
                                      //{
                                      global.cord[0,i]=file_text_read_string(fileid);
                                      str3=global.cord[0,i];
                                      str3l=string_length(str3);
                                      n=0;
                                      for(h=0;h<=str3l;h++)
                                                           {
                                                           char=string_char_at(str3,h);
                                                           if(char=="(" or char==" ")
                                                           {            
                                                           h++;
                                                           char=string_char_at(str3,h);
                                                                        if(string_digits(char)!="" or char=="-")
                                                                        {
                                                                        formnumb="";
                                                                        n++;
                                                                        while(string_digits(char)!="" or char=="-")
                                                                                                      {
                                                                                                      formnumb=formnumb+char;
                                                                                                      h++;
                                                                                                      char=string_char_at(str3,h);
                                                                                                      global.cord[i,n]=real(formnumb);
                                                                                                      }
                                                                        //h--;
                                                                        }
                                                           h--;
                                                           }
                                                           }
                                     /* global.cord[1,i]=string_digits( str3 );
                                      global.cord[2,i]=string_digits( str3 );
                                      global.cord[3,i]=string_digits( str3 );
                                      global.cord[4,i]=string_digits( str3 );
                                      global.cord[5,i]=string_digits( str3 );
                                      global.cord[6,i]=string_digits( str3 );
                                      global.cord[7,i]=string_digits( str3 );
                                      global.cord[8,i]=string_digits( str3 );
                                      global.cord[9,i]=string_digits( str3 );*/
                                      
                                      
                                      //}
                                    //until(file_text_eoln(fileid));
                                    }
                    }
                  until(string_count("editor", str2) or file_text_eof(fileid));
                  
                  for(o=1;o<=i;o++)
                  {
                  global.cord1[global.l,o]=global.cord[o,1];
                  global.cord2[global.l,o]=global.cord[o,2];
                  global.cord3[global.l,o]=global.cord[o,3];
                  global.cord4[global.l,o]=global.cord[o,4];
                  global.cord5[global.l,o]=global.cord[o,5];
                  global.cord6[global.l,o]=global.cord[o,6];
                  global.cord7[global.l,o]=global.cord[o,7];
                  global.cord8[global.l,o]=global.cord[o,8];
                  global.cord9[global.l,o]=global.cord[o,9];
                  }
                  
                  }
                  
  }
until(file_text_eof(fileid));
map=ds_map_create();
for(ls=1;ls<=global.l;ls++)for(o=1;o<=i;o++)
{
ds_map_add(map,"Poly"+string(ls)+"Face"+string(o)+"Co"+string(1),global.cord1[ls,o]);
ds_map_add(map,"Poly"+string(ls)+"Face"+string(o)+"Co"+string(2),global.cord2[ls,o]);
ds_map_add(map,"Poly"+string(ls)+"Face"+string(o)+"Co"+string(3),global.cord3[ls,o]);
ds_map_add(map,"Poly"+string(ls)+"Face"+string(o)+"Co"+string(4),global.cord4[ls,o]);
ds_map_add(map,"Poly"+string(ls)+"Face"+string(o)+"Co"+string(5),global.cord5[ls,o]);
ds_map_add(map,"Poly"+string(ls)+"Face"+string(o)+"Co"+string(6),global.cord6[ls,o]);
ds_map_add(map,"Poly"+string(ls)+"Face"+string(o)+"Co"+string(7),global.cord7[ls,o]);
ds_map_add(map,"Poly"+string(ls)+"Face"+string(o)+"Co"+string(8),global.cord8[ls,o]);
ds_map_add(map,"Poly"+string(ls)+"Face"+string(o)+"Co"+string(9),global.cord9[ls,o]);
}
ds_map_secure_save(map,get_save_filename("",""));
i=1;
