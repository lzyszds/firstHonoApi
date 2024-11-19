// 分类表的类型定义
interface WbFooterCategory {
  id: number;                    // INT PRIMARY KEY AUTO_INCREMENT
  name: string;                  // VARCHAR(50) NOT NULL
  sort_order: string;            // INT DEFAULT 0
  status: 0 | 1;                // TINYINT(1) DEFAULT 1
  created_at: Date;             // TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  updated_at: Date;             // TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
}

// 链接表的类型定义
interface WbFooterLink {
  id: number;                    // INT PRIMARY KEY AUTO_INCREMENT
  category_id: number;           // INT NOT NULL (外键关联到categories表的id)
  name: string;                  // VARCHAR(100) NOT NULL
  url: string;                   // VARCHAR(255) NOT NULL
  status: 0 | 1;                // TINYINT(1) DEFAULT 1
  sort_order: string;            // INT DEFAULT 0
  created_at: Date;             // TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  updated_at: Date;             // TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
}

interface WbFooterResult {
  id: number;
  name: string;
  sort_order: string;
  status: number;
  created_at: Date;
  updated_at: Date;
  children: WbFooterLink[];
}


// 如果你需要定义请求参数的类型，可以这样写：
interface CreateCategoryParams extends Omit<WbFooterCategory, 'id' | 'created_at' | 'updated_at'> {
  // 创建时不需要id和时间字段
}

interface CreateLinkParams extends Omit<WbFooterLink, 'id' | 'created_at' | 'updated_at'> {
  // 创建时不需要id和时间字段
}

// 如果需要定义更新参数的类型：
interface UpdateCategoryParams extends Partial<Omit<WbFooterCategory, 'id' | 'created_at' | 'updated_at'>> {
  id: number;  // 更新时需要id字段
}

interface UpdateLinkParams extends Partial<Omit<WbFooterLink, 'id' | 'created_at' | 'updated_at'>> {
  id: number;  // 更新时需要id字段
}

// 如果需要关联查询的返回类型：
interface LinkWithCategory extends WbFooterLink {
  category?: WbFooterCategory;  // 包含分类信息
}
