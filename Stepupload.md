1. Dari boilerplate Next.js NUTT git clone<br/>
2. yarn install(hapus ' di package.json kalau windows)<br/>
3. Install prisma pake<br/>
    -yarn add @prisma/client<br/>
    -yarn add @prisma/cli -D<br/>
4. init prisma nya pakai "yarn prisma init" entar dapat  folder prisma isinya .env dan schema.prisma<br/>
5. di file .env prisma ganti postgresql://USER:PASSWORD@HOST:PORT/DATABASE?schema=public ke sesuai yang ditandai(user jadi username,dsb), default schema itu public)<br/>
6. buat file schema.sql dan buat semua table disitu menggunakan sql postgres(CREATE TABLE "public"."user"(isi query) contohnya)<br/>
7. buka psql shell(dari windows search psql)<br/>
# WINDOWS:(mohon di ingat harus cd ke folder prisma terlebih dahulu di terminal awal untuk npx prisma introspect nya)<br/>
8. enter terus di psql shell nya sampai password masukin password<br/>
9. setelah masukin password ketik \connect DATABASE(DATABASE itu nama database nya di postgres,buat manual)<br/>
10. setelah connect ke database sambungin dengan schema.sql yang sudah dibuat di nomor 6 dengan command "\i 'c:/hello-prisma/schema.sql'"(ganti hello-prisma/schema.sql nya itu dengan directory nya)<br/>
11. setelah tablenya sudah dibuat/generate(bisa di check di pgAdmin4) ketik npx prisma introspect untuk introspect data dan generate table di schema.prisma<br/>
# MAC:<br/>
9-11: untuk mac ketik psql -h HOST -d DATABASE -U USER -f schema.sql ganti HOST DATABASE USER dengan yang kedaftar di postgres kemudian npx prisma introspect<br/>
12. ketik npx prisma generate untuk generate node modules prisma client<br/>
13. buat file ts di pages/api(contohnya pages/api/hello.ts)<br/>
14. buat route sesuai tutorial next<br/>
15. isi routenya dengan contoh sperti ini<br/>
<pre><code>
import { PrismaClient } from '@prisma/client';
import { NextApiRequest, NextApiResponse } from 'next';

const prisma = new PrismaClient();
let Users: unknown;
async function main() {
  Users = await prisma.user.findMany();
}

const Hello = (req: NextApiRequest, res: NextApiResponse): void => {
    main()
      .catch((e) => {
        res.status(400).json({
          error: e,
        });
      })
      .finally(async () => {
        await prisma.$disconnect();
      });
    res.status(200).json({
      data: Users,
    });
};

export default Hello;
</code></pre>
16.sudah bisa dipanggil ketik yarn dev localhost:3000/api/getuser contohnya