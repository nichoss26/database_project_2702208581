# database_project_2702208581

Proyek ini bertujuan untuk merancang struktur basis data dari sistem manajemen transaksi energi, dengan pendekatan normalization hingga bentuk normal ketiga (3NF). Dataset mengandung informasi seputar pelanggan, kontrak, penggunaan energi, pembangkit listrik, dan status pembayaran.

## Tujuan
* Menentukan Functional Dependency (FD) lengkap: Full, Parsial, dan Transitif.
* Melakukan normalisasi hingga 3NF.
* Membuat Entity Relationship Diagram (ERD).
* Menyusun SQL untuk implementasi skema database.

## Langkah-Langkah
### 1. Functional Dependency
**FD Full**
* Atribut: TransactionDate, TransactionPriority sepenuhnya bergantung pada semua komposit key.
**FD Parsial**
* Setiap ID (CustomerID, ContractID, dst.) menentukan informasi detail terkait.
**FD Transitif**
* Misalnya: ContractID → ContractStatusID → ContractStatus

### 2. Normalisasi
#### 1NF
* Data dibuat atomic, dan semua kolom sudah berisi satu nilai per sel.
#### 2NF
* Semua atribut non-primer sepenuhnya tergantung pada primary key.
* Misalnya: CustomerName tergantung pada CustomerID, bukan keseluruhan composite key.
#### 3NF
* Menghilangkan ketergantungan transitif.
* Contoh: ContractStatus dipisah menjadi entitas tersendiri karena tergantung pada ContractStatusID.

### 3. ERD
* Entitas utama: Customer, EnergyPlan, PowerPlant, EnergySource, Contract, EnergyUsage, PaymentStatus, Transaction.
* Setiap entitas memiliki atribut yang berasal dari FD Parsial.
* Relasi antara entitas ditentukan melalui foreign key (misalnya: Transaction memiliki foreign key ke Customer, Contract, dll.)


### 4. SQL
melakukan ddl dan dml
